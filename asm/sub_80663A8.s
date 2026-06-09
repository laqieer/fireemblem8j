	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_80663A8, "ax", %progbits
@ sub_80663A8 @ JP 0x080663A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80663A8
	.thumb_func
sub_80663A8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _080663FC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066400 @ =0x086017A8
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _08066404 @ =0x087632D4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldr r0, _08066408 @ =0x08762C54
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806640C @ =0x08762468
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080663FC: .4byte 0x0201774C
_08066400: .4byte 0x086017A8
_08066404: .4byte 0x087632D4
_08066408: .4byte 0x08762C54
_0806640C: .4byte 0x08762468

