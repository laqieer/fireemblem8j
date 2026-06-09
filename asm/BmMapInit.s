	.syntax unified
	.section .text.BmMapInit, "ax", %progbits
@ BmMapInit @ JP 0x0801947C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BmMapInit
	.thumb_func
BmMapInit:
	push {r4, r5, r6, r7, lr}
	mov ip, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r2, _080194B8 @ =0x03000800
	str r0, [r2]
	adds r6, #2
	adds r5, #4
	lsls r1, r5, #2
	adds r4, r0, r1
	movs r3, #0
	adds r7, r2, #0
	cmp r3, r5
	bge _080194A8
_08019498:
	ldr r1, [r2]
	lsls r0, r3, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r4, r4, r6
	adds r3, #1
	cmp r3, r5
	blt _08019498
_080194A8:
	ldr r0, [r7]
	adds r0, #8
	mov r1, ip
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080194B8: .4byte 0x03000800

