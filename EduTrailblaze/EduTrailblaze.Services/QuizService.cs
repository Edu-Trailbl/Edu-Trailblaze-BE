﻿using EduTrailblaze.Entities;
using EduTrailblaze.Repositories.Interfaces;
using EduTrailblaze.Services.DTOs;
using EduTrailblaze.Services.Helper;
using EduTrailblaze.Services.Interfaces;

namespace EduTrailblaze.Services
{
    public class QuizService : IQuizService
    {
        private readonly IRepository<Quiz, int> _quizRepository;

        public QuizService(IRepository<Quiz, int> quizRepository)
        {
            _quizRepository = quizRepository;
        }

        public async Task<Quiz?> GetQuiz(int quizId)
        {
            try
            {
                return await _quizRepository.GetByIdAsync(quizId);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the quiz.", ex);
            }
        }

        public async Task<IEnumerable<Quiz>> GetQuizs()
        {
            try
            {
                return await _quizRepository.GetAllAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the quiz.", ex);
            }
        }

        public async Task AddQuiz(Quiz quiz)
        {
            try
            {
                await _quizRepository.AddAsync(quiz);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the quiz.", ex);
            }
        }

        public async Task UpdateQuiz(Quiz quiz)
        {
            try
            {
                await _quizRepository.UpdateAsync(quiz);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the quiz.", ex);
            }
        }

        public async Task DeleteQuiz(Quiz quiz)
        {
            try
            {
                await _quizRepository.DeleteAsync(quiz);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the quiz.", ex);
            }
        }

        public async Task AddQuiz(CreateQuizRequest quiz)
        {
            try
            {
                var newQuiz = new Quiz
                {
                    LectureId = quiz.LectureId,
                    Title = quiz.Title,
                    PassingScore = quiz.PassingScore
                };
                await _quizRepository.AddAsync(newQuiz);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the quiz.", ex);
            }
        }

        public async Task UpdateQuiz(UpdateQuizRequest quiz)
        {
            try
            {
                var quizToUpdate = await _quizRepository.GetByIdAsync(quiz.QuizzId);
                if (quizToUpdate == null)
                {
                    throw new Exception("Quiz not found.");
                }
                quizToUpdate.Title = quiz.Title;
                quizToUpdate.PassingScore = quiz.PassingScore;
                quizToUpdate.UpdatedAt = DateTimeHelper.GetVietnamTime();
                await _quizRepository.UpdateAsync(quizToUpdate);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the quiz.", ex);
            }
        }

        public async Task DeleteQuiz(int quizId)
        {
            try
            {
                var quiz = await _quizRepository.GetByIdAsync(quizId);
                if (quiz == null)
                {
                    throw new Exception("Quiz not found.");
                }
                await _quizRepository.DeleteAsync(quiz);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the quiz.", ex);
            }
        }
    }
}
