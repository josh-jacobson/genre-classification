import os
import random
import re
from string import punctuation
import math

NUMBER_OF_GENRES = 5
MUSIC_DIRECTORY = 'lyrics'
TEST_DIRECTORY = 'ZZZTestFiles'

###########################################################################
# Move files to a temporary testing directory for validation
############################################################################
def moveFiles():
	print "Moving files for testing...\n"
	NUMBER_OF_FOLDS = 10

	# Initialize variables
	os.chdir(MUSIC_DIRECTORY)
	dir = os.getcwd()
	genreDirectories = os.listdir(dir)
	totalFileCount = 0
	fileCounts = []

	if not os.path.exists(TEST_DIRECTORY):
		os.mkdir(TEST_DIRECTORY)

	# Get all file counts
	for genreDirectory in genreDirectories:
		if genreDirectory[0] != '.' and genreDirectory != TEST_DIRECTORY:
			files = os.listdir(os.getcwd() + '/' + genreDirectory)
			# for i in xrange(len(files)/NUMBER_OF_FOLDS):
			i = 0
			filesToMove = 5
			while i < filesToMove:
				if files[i][0] == '.':
					i += 1
					filesToMove += 1
				os.rename(genreDirectory + '/' + files[i], TEST_DIRECTORY + '/' + genreDirectory+'_'+files[i])
				i += 1


	# 	totalFileCount += curCount
	# 	fileCounts.append(curCount)


	

	# # Create random permutation of file numbers
	# # fileNums = list(xrange(totalFileCount))
	# # random.shuffle(fileNums)

	# # for i in xrange(totalFileCount/NUMBER_OF_FOLDS):
	# for i in xrange(2):
	# 	fileNum = fileNums[i]
	# 	j = 0
	# 	while fileNum >= fileCounts[j]:
	# 		j += 1
	# 		fileNum -= fileCounts[j]

	# 	fileName = os.listdir(genreDirectories[j])[fileNum]
	# 	fileCounts[j] -= 1
	# 	os.rename(genreDirectories[j] + '/' + fileName, 'TestFiles/' + fileName)

	os.chdir('..')


###########################################################################
###########################################################################
def buildDictionary():
	os.chdir(MUSIC_DIRECTORY)
	dictionary = {}

	# Parent directory
	dir = os.getcwd()
	genreDirectories = os.listdir(dir)

	index = 0
	fileCounts = [0] * NUMBER_OF_GENRES # Save total number of files in all genres
	for genreDirectory in genreDirectories:
		if genreDirectory[0] != '.' and genreDirectory != TEST_DIRECTORY:
			retVals = readGenre(dictionary, genreDirectory + "/", index)
			dictionary = retVals[0]
			fileCounts[index] = retVals[1]
			index += 1

	# Convert to percentages, add to file
	os.chdir('..')
	dictFile = open('dictionary.txt', 'w')
	dictKeys = dictionary.keys()
	dictKeys.sort()
	dictKeys.reverse()
	for key in dictKeys:
		counts = dictionary[key]
		counts = [float(count)/(numFiles+1) for count,numFiles in zip(counts, fileCounts)]
		dictionary[key] = counts
		dictFile.write(key + ' ')
		dictFile.write(' '.join(str(c) for c in counts))
		dictFile.write('\n')

	return dictionary


###########################################################################
# Read every file in a genre and add all unique COUNTS to a dictionary
# Returns the dictionary as well as the number of files read
#   NOTE: the return dictionary contains counts, not percentages, so the calling
#         function will have to deal with that
###########################################################################
def readGenre(dictionary, path, genreNumber):
	print "Adding files from " + path + " to dictionary"

	dir = os.getcwd()
	files = os.listdir(dir + "/" + path)
	numberOfFiles = 0


	for filename in files:
		if filename[0] != '.':
			# Read file
			words = readFile(path + "/" + filename)

			# Add to dictionary
			for word in words:
				if word in dictionary:
					counts = dictionary[word]
					counts[genreNumber] += 1
				else:
					counts = [1] * NUMBER_OF_GENRES # Kluge
					counts[genreNumber] += 1
				dictionary[word] = counts

			numberOfFiles += 1

	return [dictionary, numberOfFiles]

###########################################################################
# Read a file and return all unique words
###########################################################################
def readFile(filename):
	file = open(filename, 'r')
	content = file.read()
	file.close()

	# Could all be combined into one line, but spread into multiple lines for clarity
	# words = re.findall(r'[\w]+', content)     # Get array of words
	# words = re.split('\W+', content)
	words = [word.strip(punctuation) for word in content.split()]
	words = [word.upper() for word in words]  # Make all words lowercase
	words = set(words)                        # Get unique words
	words = list(words)                       # Turn set into list so we can access elements	
	words.sort()                           	  # Sort anti-alphabetically (why, Python?)
	words.reverse()                           # Reverse

	return words

###########################################################################
###########################################################################
def validate(dictionary):
	print "\nClassifications:"
	os.chdir(MUSIC_DIRECTORY + '/' + TEST_DIRECTORY)
	testFiles = os.listdir(os.getcwd())
	for testFile in testFiles:
		if testFile[0] != '.':
			baseProb = float(1)/NUMBER_OF_GENRES
			totalProbs = [math.log(baseProb, 2)] * NUMBER_OF_GENRES
			words = readFile(testFile)
			for word in words:
				if word in dictionary:
					# print "   Word: " + word
					# print "     " + str(totalProbs)
					# print "   - " + str([math.log(wordProb,2) for wordProb in dictionary[word]]) + " from " + str(dictionary[word])			
					totalProbs = [prob+math.log(wordProb,2) for prob,wordProb in zip(totalProbs, dictionary[word])]
					# print "     " + str(totalProbs)
					# print ""


			genres = os.listdir('..')
			print "I would classify " + testFile + " as " + genres[totalProbs.index(max(totalProbs))]

	os.chdir('../..')


def moveFilesBack():
	os.chdir(MUSIC_DIRECTORY + '/' + TEST_DIRECTORY)
	testFiles = os.listdir(os.getcwd())
	for file in testFiles:
		if file[0] != '.':
			parts = file.split('_')
			os.rename(file, '../' + parts[0] + '/' + parts[1])

	os.chdir('../..')



# Main
print ""
moveFiles()
dict = buildDictionary()
validate(dict)
moveFilesBack()
