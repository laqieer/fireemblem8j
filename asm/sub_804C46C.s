	.syntax unified
	.set sub_80088FC, 0x080088FC + 1
	.section .text.sub_804C46C, "ax", %progbits
@ sub_804C46C @ JP 0x0804C46C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C46C
	.thumb_func
sub_804C46C:
	push {lr}
	bl sub_80088FC
	adds r1, r0, #0
	cmp r1, #1
	bne _0804C484
	ldr r0, _0804C480 @ =0x0203DD8C
	strb r1, [r0, #8]
	b _0804C48A
	.align 2, 0
_0804C480: .4byte 0x0203DD8C
_0804C484:
	ldr r1, _0804C490 @ =0x0203DD8C
	movs r0, #0
	strb r0, [r1, #8]
_0804C48A:
	pop {r0}
	bx r0
	.align 2, 0
_0804C490: .4byte 0x0203DD8C

