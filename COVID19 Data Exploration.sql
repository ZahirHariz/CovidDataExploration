Select * 
From PortfolioProject.dbo.CovidDeaths
Order by 3,4

--Select * 
--From PortfolioProject.dbo.CovidVaccinations
--Order by 3,4


-- Delete Rows with Location == Israel
Delete 
From CovidDeaths 
Where Location = 'Israel'

Delete 
From CovidVaccinations 
Where Location = 'Israel'


-- Select Data
Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject.dbo.CovidDeaths
Order By 1,2 


-- Looking at Total Cases vs Total Deaths
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Order By 1,2 

-- Looking at Total Cases vs Total Deaths in Malaysia
-- Shows likelihood of dying if you got covid in Malaysia
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where Location like 'Malaysia'
Order By 1,2 


-- Total Cases vs Population
Select Location, date, population, total_cases, (total_cases/population)*100 as InfectedPopulationPercentage
From PortfolioProject..CovidDeaths
Order By 1,2 

-- Total Cases vs Population in Malaysia
-- Shows percentage of Malaysian got Covid
Select Location, date, population, total_cases, (total_cases/population)*100 as InfectedPopulationPercentage
From PortfolioProject..CovidDeaths
Where Location like 'Malaysia'
Order By 1,2 


-- Looking at Countries with Highest Infection Rate compared to Population
Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as 
	InfectedPopulationPercentage
From PortfolioProject..CovidDeaths
Group by Location, population
Order By InfectedPopulationPercentage desc


-- Showing Countries with Highest Death Count per Population
Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Group by Location, population
Order By TotalDeathCount desc

-- Continent is in list of Countries
-- Removing Continent for better display
Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null
Group by Location, population
Order By TotalDeathCount desc

-- Showing Continent with Highest Death Count per Population
-- Not accurate
Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null
Group by continent
Order By TotalDeathCount desc

-- Accurate one
Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is null
Group by location
Order By TotalDeathCount desc



