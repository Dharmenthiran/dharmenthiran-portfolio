import { useState } from "react";
import { Link, useLocation } from "react-router-dom";
import { motion } from "framer-motion";
import { Menu, X, Download, Eye } from "lucide-react";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import ThemeToggle from "./ThemeToggle";

const Navigation = () => {
  const [isOpen, setIsOpen] = useState(false);
  const location = useLocation();

  const navItems: Array<{ name: string; path: string; hidden?: boolean }> = [
    { name: "Home", path: "/" },
    { name: "Experience", path: "/experience" },
    { name: "Projects", path: "/projects" },
    { name: "Skills", path: "/skills" },
    { name: "Blog", path: "/blog", hidden: true },
    { name: "Coding Profiles", path: "/coding-profiles", hidden: true },
    { name: "Contact", path: "/contact" },
  ];

  const isActive = (path: string) => location.pathname === path;

  // Get the resume viewer URL
  const getResumeViewerUrl = () => {
    const resumeUrl = `${window.location.origin}/Dhermenthiran-Software-Developer.docx`;
    // Use Microsoft Office Online Viewer
    return `https://view.officeapps.live.com/op/embed.aspx?src=${encodeURIComponent(resumeUrl)}`;
  };

  return (
    <motion.nav
      initial={{ y: -100 }}
      animate={{ y: 0 }}
      className="fixed top-0 left-0 right-0 z-50 glass"
    >
      <div className="container mx-auto px-4 py-3 md:py-4">
        <div className="flex items-center justify-between">
          <Link to="/" className="text-xl md:text-2xl font-bold gradient-text">
            DT
          </Link>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center gap-8">
            {navItems.filter(item => !item.hidden).map((item) => (
              <Link
                key={item.path}
                to={item.path}
                className={`relative transition-colors ${
                  isActive(item.path)
                    ? "text-primary"
                    : "text-foreground hover:text-primary"
                }`}
              >
                {item.name}
                {isActive(item.path) && (
                  <motion.div
                    layoutId="activeNav"
                    className="absolute -bottom-1 left-0 right-0 h-0.5 bg-primary glow-primary"
                  />
                )}
              </Link>
            ))}
            <ThemeToggle />
            <DropdownMenu>
              <DropdownMenuTrigger asChild>
                <Button variant="default" className="glow-primary">
                  <Download className="mr-2 h-4 w-4" />
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
          </div>

          {/* Mobile Menu Button */}
          <button
            className="md:hidden text-foreground"
            onClick={() => setIsOpen(!isOpen)}
          >
            {isOpen ? <X size={24} /> : <Menu size={24} />}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isOpen && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: "auto" }}
            exit={{ opacity: 0, height: 0 }}
            className="md:hidden mt-4 pb-4 flex flex-col gap-3 border-t border-border/50"
          >
            {navItems.filter(item => !item.hidden).map((item) => (
              <Link
                key={item.path}
                to={item.path}
                onClick={() => setIsOpen(false)}
                className={`py-2 px-2 rounded-md transition-colors ${
                  isActive(item.path) 
                    ? "text-primary bg-primary/10" 
                    : "text-foreground hover:bg-accent/50"
                }`}
              >
                {item.name}
              </Link>
            ))}
            <div className="flex items-center justify-between gap-4 pt-2 border-t border-border/50">
              <span className="text-sm text-muted-foreground">Theme:</span>
              <ThemeToggle />
            </div>
            <div className="flex flex-col gap-2 mt-2">
              <Button 
                variant="default" 
                className="w-full glow-primary"
                asChild
              >
                <a 
                  href="/Dhermenthiran-Software-Developer.docx" 
                  download="Dhermenthiran-Software-Developer.docx"
                  className="flex items-center justify-center"
                >
                  <Download className="mr-2 h-4 w-4" />
                  Download Resume
                </a>
              </Button>
              <Button 
                variant="outline" 
                className="w-full border-primary/50 hover:bg-primary/10"
                asChild
              >
                <a 
                  href={getResumeViewerUrl()}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center justify-center"
                >
                  <Eye className="mr-2 h-4 w-4" />
                  View Resume
                </a>
              </Button>
            </div>
          </motion.div>
        )}
      </div>
    </motion.nav>
  );
};

export default Navigation;
