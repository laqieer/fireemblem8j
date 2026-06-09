	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_80649F0, "ax", %progbits
@ sub_80649F0 @ JP 0x080649F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80649F0
	.thumb_func
sub_80649F0:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _08064A3C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064A40 @ =0x0860124C
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x46
	strh r0, [r4, #0x2e]
	ldr r3, _08064A44 @ =0x087557DC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064A3C: .4byte 0x0201774C
_08064A40: .4byte 0x0860124C
_08064A44: .4byte 0x087557DC

