	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B33E0, "ax", %progbits
@ sub_80B33E0 @ JP 0x080B33E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B33E0
	.thumb_func
sub_80B33E0:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, _080B3414 @ =0x08A9DD8C
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x3c]
	mov r1, sb
	str r1, [r0, #0x40]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3414: .4byte 0x08A9DD8C

