	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C0A08, "ax", %progbits
@ sub_80C0A08 @ JP 0x080C0A08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0A08
	.thumb_func
sub_80C0A08:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080C0A34 @ =0x08AC1954
	adds r1, r4, #0
	bl sub_8002BCC
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r6, [r1]
	mov r1, r8
	str r1, [r0, #0x4c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C0A34: .4byte 0x08AC1954

