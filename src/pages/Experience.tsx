import { motion } from "framer-motion";
import { Briefcase, Calendar, MapPin, ExternalLink } from "lucide-react";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

// Function to calculate experience duration
const calculateExperience = (startDate: string, endDate: string | null = null): string => {
  const start = new Date(startDate);
  const end = endDate ? new Date(endDate) : new Date();
  
  let years = end.getFullYear() - start.getFullYear();
  let months = end.getMonth() - start.getMonth();
  
  if (months < 0) {
    years--;
    months += 12;
  }
  
  if (years === 0) {
    return `${months} ${months === 1 ? 'mo' : 'mos'}`;
  } else if (months === 0) {
    return `${years} ${years === 1 ? 'yr' : 'yrs'}`;
  } else {
    return `${years} ${years === 1 ? 'yr' : 'yrs'} ${months} ${months === 1 ? 'mo' : 'mos'}`;
  }
};

// Function to format date range
const formatDateRange = (startDate: string, endDate: string | null = null): string => {
  const start = new Date(startDate);
  const end = endDate ? new Date(endDate) : null;
  
  const startFormatted = start.toLocaleDateString('en-US', { month: 'short', year: 'numeric' });
  const endFormatted = end ? end.toLocaleDateString('en-US', { month: 'short', year: 'numeric' }) : 'Present';
  const duration = calculateExperience(startDate, endDate);
  
  return `${startFormatted} - ${endFormatted} · ${duration}`;
};

const Experience = () => {
  const startDate = "2024-01-01"; // Jan 2024
  const endDate = null; // Present
  
  const experiences = [
    {
      title: "Software Developer",
      company: "SPI Equipment",
      location: "Coimbatore, Tamil Nadu, India · On-site",
      startDate: startDate,
      endDate: endDate,
      period: formatDateRange(startDate, endDate),
      employmentType: "Full-time",
      description: "Developing and maintaining software solutions using Python frameworks (Flask, Django, FastAPI) and mobile applications with Flutter. Working on full-stack solutions with MySQL and SQLite databases. Building scalable applications and implementing efficient backend systems.",
      technologies: ["Python", "Flask", "Django", "FastAPI", "Flutter", "Dart", "MySQL", "SQLite", "Git"],
      linkedin: "https://www.linkedin.com/in/dharmenthiran-t-248173276",
    },
  ];

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.1,
      },
    },
  };

  const itemVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: { opacity: 1, y: 0 },
  };

  return (
    <div className="min-h-screen pt-24 md:pt-32 pb-20 md:pb-20">
      <div className="container mx-auto px-4">
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="text-center mb-12 md:mb-16"
        >
          <h1 className="text-3xl sm:text-4xl md:text-5xl lg:text-6xl font-bold mb-3 md:mb-4">
            <span className="gradient-text">Work Experience</span>
          </h1>
          <p className="text-base sm:text-lg md:text-xl text-muted-foreground max-w-2xl mx-auto px-4">
            My professional journey and work experience. Check my{" "}
            <a 
              href="https://www.linkedin.com/in/dharmenthiran-t-248173276" 
              target="_blank" 
              rel="noopener noreferrer"
              className="text-primary hover:underline"
            >
              LinkedIn
            </a>{" "}
            for detailed information.
          </p>
        </motion.div>

        <motion.div
          variants={containerVariants}
          initial="hidden"
          animate="visible"
          className="max-w-4xl mx-auto space-y-6"
        >
          {experiences.map((exp, index) => (
            <motion.div key={index} variants={itemVariants}>
              <Card className="glass p-6 md:p-8 hover:glow-primary transition-all duration-300">
                <div className="flex flex-col md:flex-row md:items-start md:justify-between gap-4 mb-4">
                  <div className="flex-1">
                    <div className="flex items-center gap-3 mb-2">
                      <div className="p-2 rounded-lg bg-primary/20 glow-primary">
                        <Briefcase className="h-5 w-5 text-primary" />
                      </div>
                      <div>
                        <h3 className="text-xl md:text-2xl font-bold">{exp.title}</h3>
                        <p className="text-lg text-primary font-semibold">{exp.company}</p>
                      </div>
                    </div>
                    
                    <div className="flex flex-wrap items-center gap-4 mt-3 text-sm text-muted-foreground">
                      <div className="flex items-center gap-2">
                        <Calendar className="h-4 w-4" />
                        <span>{exp.period}</span>
                      </div>
                      <div className="flex items-center gap-2">
                        <MapPin className="h-4 w-4" />
                        <span>{exp.location}</span>
                      </div>
                      {exp.employmentType && (
                        <div className="px-2 py-1 text-xs rounded-full bg-primary/20 text-primary border border-primary/30">
                          {exp.employmentType}
                        </div>
                      )}
                    </div>
                  </div>
                  
                  <Button
                    variant="outline"
                    size="sm"
                    className="border-primary/50 hover:bg-primary/10"
                    asChild
                  >
                    <a 
                      href={exp.linkedin} 
                      target="_blank" 
                      rel="noopener noreferrer"
                      className="flex items-center gap-2"
                    >
                      View on LinkedIn
                      <ExternalLink className="h-4 w-4" />
                    </a>
                  </Button>
                </div>

                <p className="text-muted-foreground mb-4 leading-relaxed">
                  {exp.description}
                </p>

                <div className="flex flex-wrap gap-2">
                  {exp.technologies.map((tech, techIndex) => (
                    <span
                      key={techIndex}
                      className="px-3 py-1 text-xs rounded-full bg-primary/20 text-primary border border-primary/30"
                    >
                      {tech}
                    </span>
                  ))}
                </div>
              </Card>
            </motion.div>
          ))}

          {/* LinkedIn CTA */}
          <motion.div variants={itemVariants}>
            <Card className="glass p-6 md:p-8 text-center border-2 border-dashed border-primary/30">
              <p className="text-muted-foreground mb-4">
                For complete work history and detailed experience, please visit my LinkedIn profile.
              </p>
              <Button
                variant="default"
                className="glow-primary"
                asChild
              >
                <a 
                  href="https://www.linkedin.com/in/dharmenthiran-t-248173276" 
                  target="_blank" 
                  rel="noopener noreferrer"
                  className="flex items-center gap-2"
                >
                  View Full Profile on LinkedIn
                  <ExternalLink className="h-4 w-4" />
                </a>
              </Button>
            </Card>
          </motion.div>
        </motion.div>
      </div>
    </div>
  );
};

export default Experience;

