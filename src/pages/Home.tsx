import { motion } from "framer-motion";
import { ArrowRight, Download, Eye } from "lucide-react";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Link } from "react-router-dom";
import Hero3D from "@/components/Hero3D";
import heroBg from "@/assets/hero-bg.jpg";

const Home = () => {
  // Get the resume viewer URL
  const getResumeViewerUrl = () => {
    const resumeUrl = `${window.location.origin}/Dhermenthiran-Software-Developer.docx`;
    // Use Microsoft Office Online Viewer
    return `https://view.officeapps.live.com/op/embed.aspx?src=${encodeURIComponent(resumeUrl)}`;
  };

  return (
    <div className="min-h-screen relative overflow-hidden">
      {/* Hero Background */}
      <div 
        className="absolute inset-0 opacity-20"
        style={{
          backgroundImage: `url(${heroBg})`,
          backgroundSize: 'cover',
          backgroundPosition: 'center',
        }}
      />
      
      <div className="container mx-auto px-4 pt-24 md:pt-32 pb-20 md:pb-20 relative z-10">
        <div className="grid lg:grid-cols-2 gap-8 md:gap-12 items-center min-h-[60vh] md:min-h-[80vh]">
          {/* Left Content */}
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.8 }}
            className="space-y-8"
          >
            <div className="space-y-3 md:space-y-4">
              <motion.p
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                transition={{ delay: 0.2 }}
                className="text-primary text-base md:text-lg font-semibold"
              >
                Hello, I'm
              </motion.p>
              
              <h1 className="text-4xl sm:text-5xl md:text-6xl lg:text-7xl font-bold leading-tight">
                <span className="gradient-text">Dharmenthiran T</span>
              </h1>
              
              <motion.div
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                transition={{ delay: 0.4 }}
                className="space-y-2 md:space-y-3"
              >
                <p className="text-xl sm:text-2xl md:text-3xl text-muted-foreground">
                  Full Stack Engineer
                </p>
                <p className="text-sm sm:text-base md:text-lg text-muted-foreground leading-relaxed">
                  Hi, I'm Dharmenthiran T — a Full Stack Engineer with hands-on experience in building dynamic and scalable applications. I specialize in Python frameworks such as{" "}
                  <span className="text-primary">Flask</span>,{" "}
                  <span className="text-secondary">Django</span>, and{" "}
                  <span className="text-accent">FastAPI</span>, along with{" "}
                  <span className="text-primary">Flutter</span> and{" "}
                  <span className="text-secondary">Dart</span> for cross-platform development. I love crafting efficient backend systems and seamless front-end experiences that bring ideas to life. Always eager to learn and explore new technologies in the full-stack ecosystem.
                </p>
              </motion.div>
            </div>

            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.6 }}
              className="flex flex-col sm:flex-row flex-wrap gap-3 md:gap-4"
            >
              <Link to="/projects" className="w-full sm:w-auto">
                <Button size="lg" className="w-full sm:w-auto glow-primary group">
                  View My Work
                  <ArrowRight className="ml-2 h-5 w-5 group-hover:translate-x-1 transition-transform" />
                </Button>
              </Link>
              
              <DropdownMenu>
                <DropdownMenuTrigger asChild>
                  <Button size="lg" variant="outline" className="w-full sm:w-auto border-primary text-primary hover:bg-primary hover:text-primary-foreground">
                    <Download className="mr-2 h-5 w-5" />
                    Resume
                  </Button>
                </DropdownMenuTrigger>
                <DropdownMenuContent align="end" className="w-48">
                  <DropdownMenuItem asChild>
                    <a 
                      href="/Dhermenthiran-Software-Developer.docx" 
                      download="Dhermenthiran-Software-Developer.docx"
                      className="flex items-center cursor-pointer"
                    >
                      <Download className="mr-2 h-4 w-4" />
                      Download Resume
                    </a>
                  </DropdownMenuItem>
                  <DropdownMenuItem asChild>
                    <a 
                      href={getResumeViewerUrl()}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="flex items-center cursor-pointer"
                    >
                      <Eye className="mr-2 h-4 w-4" />
                      View Resume
                    </a>
                  </DropdownMenuItem>
                </DropdownMenuContent>
              </DropdownMenu>
            </motion.div>

            {/* Tech Stack Icons */}
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 0.8 }}
              className="flex flex-col sm:flex-row gap-3 sm:gap-4 items-start sm:items-center pt-6 md:pt-8"
            >
              <p className="text-xs sm:text-sm text-muted-foreground whitespace-nowrap">Tech Stack:</p>
              <div className="flex flex-wrap gap-2 sm:gap-3">
                {['Python', 'Flask', 'Django', 'FastAPI', 'Flutter'].map((tech, index) => (
                  <motion.div
                    key={tech}
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.8 + index * 0.1 }}
                    className="px-2 sm:px-3 py-1 rounded-full glass text-xs sm:text-sm font-medium"
                  >
                    {tech}
                  </motion.div>
                ))}
              </div>
            </motion.div>
          </motion.div>

          {/* Right 3D Element */}
          <motion.div
            initial={{ opacity: 0, scale: 0.8 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 1, delay: 0.4 }}
            className="hidden lg:block h-[400px] lg:h-[500px] relative"
          >
            <div className="absolute inset-0 glow-primary rounded-full blur-3xl opacity-30" />
            <Hero3D />
          </motion.div>
        </div>
      </div>
    </div>
  );
};

export default Home;
