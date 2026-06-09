	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C11E8, "ax", %progbits
@ sub_80C11E8 @ JP 0x080C11E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C11E8
	.thumb_func
sub_80C11E8:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r0, _080C1214 @ =0x08AC1984
	adds r1, r4, #0
	bl sub_8002BCC
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r6, [r1]
	mov r1, r8
	str r1, [r0, #0x40]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C1214: .4byte 0x08AC1984

