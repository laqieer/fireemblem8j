	.syntax unified
	.set GetCgTextFlags, 0x08090D10 + 1
	.section .text.sub_80922DC, "ax", %progbits
@ sub_80922DC @ JP 0x080922DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80922DC
	.thumb_func
sub_80922DC:
	push {lr}
	bl GetCgTextFlags
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _080922EE
	movs r0, #0
	b _080922F0
_080922EE:
	movs r0, #1
_080922F0:
	pop {r1}
	bx r1

