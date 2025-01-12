﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public enum RequestStatus
    {
        Open = 1,
        Distributed = 2,
        Proccesing = 3,
        Checking = 4,
        Closed = 5
    }

    public enum RequestPriority
    {
        Low = 1,
        Medium = 2,
        High = 3,
        Critical = 4
    }

    public class Request
    {
        public int Id { get; set; }
        [Required]
        [Display(Name = "Название заявки")]
        [MaxLength(50, ErrorMessage = "Превышена максимальная длина записи")]
        public string Name { get; set; }
        [Required]
        [Display(Name = "Описание")]
        [MaxLength(200, ErrorMessage = "Превышена максимальная длина записи")]
        public string Description { get; set; }
        [Display(Name = "Комментарий")]
        [MaxLength(200, ErrorMessage = "Превышена максимальная длина записи")]
        public string Comment { get; set; }
        [Display(Name = "Статус")]
        public int Status { get; set; }
        [Display(Name = "Приоритет")]
        public int Priority { get; set; }
        [Display(Name = "Кабинет")]
        public int? ActivId { get; set; }
        public Activ Activ { get; set; }
        [Display(Name = "Файл с ошибкой")]
        public string File { get; set; }
        [Display(Name = "Категория")]
        public int? CategoryId { get; set; }
        public Category Category { get; set; }
        public int? UserId { get; set; }
        public User User { get; set; }
        public int? ExecutorId { get; set; }
        public User Executor { get; set; }

        public int LifecycleId { get; set; }
        public Lifecycle Lifecycle { get; set; }
    }

    public class Lifecycle
    {
        public int Id { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy H:mm:ss}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime Opened { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy H:mm:ss}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime? Distributed { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy H:mm:ss}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime? Proccesing { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy H:mm:ss}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime? Checking { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy H:mm:ss}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime? Closed { get; set; }
    }
}