	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_80D6240, "ax", %progbits
@ sub_80D6240 @ JP 0x080D6240 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6240
	.thumb_func
sub_80D6240:
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _080D625C @ =0x081F70E8
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl sub_80D65C4
	pop {r0}
	bx r0
	.align 2, 0
_080D625C: .4byte 0x081F70E8

