	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807167C, "ax", %progbits
@ sub_807167C @ JP 0x0807167C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807167C
	.thumb_func
sub_807167C:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080716A8 @ =0x08603CE8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080716A8: .4byte 0x08603CE8

