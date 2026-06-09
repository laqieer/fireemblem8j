	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_804FCC4, "ax", %progbits
@ sub_804FCC4 @ JP 0x0804FCC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804FCC4
	.thumb_func
sub_804FCC4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _0804FCD6
	adds r0, r4, #0
	bl sub_80D65C0
_0804FCD6:
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r1, [r1]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _0804FCF4
	adds r0, r4, #0
	bl sub_80D65C4
_0804FCF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

