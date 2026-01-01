import { motion } from "framer-motion";
import { Github, Linkedin, Twitter, Instagram, Mail } from "lucide-react";

const SocialLinks = () => {
  const socials = [
    { icon: Github, link: "https://github.com/Dharmenthiran", label: "GitHub" },
    { icon: Linkedin, link: "https://www.linkedin.com/in/dharmenthiran-t-248173276", label: "LinkedIn" },
    { icon: Twitter, link: "https://twitter.com/dharma22twitter", label: "Twitter" },
    { icon: Instagram, link: "https://instagram.com/dharma._4506", label: "Instagram" },
    { icon: Mail, link: "mailto:tdharmenthiran@gmail.com", label: "Email" },
  ];

  return (
    <>
      {/* Desktop: Left Side Vertical */}
      <motion.div
        initial={{ opacity: 0, x: -50 }}
        animate={{ opacity: 1, x: 0 }}
        transition={{ delay: 1 }}
        className="fixed left-4 md:left-8 bottom-0 hidden lg:flex flex-col items-center gap-6 z-40"
      >
        {socials.map((social, index) => (
          <motion.a
            key={social.label}
            href={social.link}
            target="_blank"
            rel="noopener noreferrer"
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 1.2 + index * 0.1 }}
            whileHover={{ scale: 1.2, y: -5 }}
            className="p-3 rounded-lg glass hover:glow-primary transition-all duration-300 group"
            aria-label={social.label}
          >
            <social.icon className="h-5 w-5 text-foreground group-hover:text-primary transition-colors" />
          </motion.a>
        ))}
        <div className="w-px h-24 bg-gradient-to-b from-primary to-transparent" />
      </motion.div>

      {/* Mobile: Bottom Center Horizontal */}
      <div className="fixed bottom-3 sm:bottom-4 left-0 right-0 lg:hidden z-40 flex justify-center px-2">
        <motion.div
          initial={{ opacity: 0, y: 50 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 1 }}
          className="flex flex-row items-center justify-center gap-0.5 sm:gap-1 md:gap-1.5 px-1.5 sm:px-2 md:px-2.5 py-1.5 sm:py-2 md:py-2 rounded-full glass backdrop-blur-lg border border-border/50 w-full max-w-fit"
        >
          {socials.map((social, index) => (
            <motion.a
              key={social.label}
              href={social.link}
              target="_blank"
              rel="noopener noreferrer"
              initial={{ opacity: 0, scale: 0 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ delay: 1.2 + index * 0.1 }}
              whileTap={{ scale: 0.9 }}
              className="p-1.5 sm:p-1.5 md:p-2 rounded-md hover:bg-primary/20 active:bg-primary/30 hover:glow-primary transition-all duration-300 group flex-shrink-0 flex items-center justify-center touch-manipulation"
              aria-label={social.label}
            >
              <social.icon className="h-3.5 w-3.5 sm:h-4 sm:w-4 md:h-4 md:w-4 text-foreground group-hover:text-primary transition-colors flex-shrink-0" />
            </motion.a>
          ))}
        </motion.div>
      </div>
    </>
  );
};

export default SocialLinks;
