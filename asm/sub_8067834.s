	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8067834, "ax", %progbits
@ sub_8067834 @ JP 0x08067834 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067834
	.thumb_func
sub_8067834:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r6, r2, #0
	ldr r1, _08067874 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08067878 @ =0x08601C68
	movs r1, #4
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0806787C @ =0x020228A8
	ldr r1, _08067880 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	strh r6, [r4, #0x2e]
	mov r0, r8
	strh r0, [r4, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067874: .4byte 0x0201774C
_08067878: .4byte 0x08601C68
_0806787C: .4byte 0x020228A8
_08067880: .4byte 0x020165C8

