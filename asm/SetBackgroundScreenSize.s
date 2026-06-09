	.syntax unified
	.set BG_GetControlBuffer, 0x08000EF4 + 1
	.section .text.SetBackgroundScreenSize, "ax", %progbits
@ SetBackgroundScreenSize @ JP 0x08000FFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetBackgroundScreenSize
	.thumb_func
SetBackgroundScreenSize:
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl BG_GetControlBuffer
	lsls r4, r4, #6
	ldrb r2, [r0, #1]
	movs r1, #0x3f
	ands r1, r2
	orrs r1, r4
	strb r1, [r0, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

