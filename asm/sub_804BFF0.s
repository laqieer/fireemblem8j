	.syntax unified
	.set MuExistsActive, 0x0807AB5C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804BC1C, 0x0804BC1C + 1
	.section .text.sub_804BFF0, "ax", %progbits
@ sub_804BFF0 @ JP 0x0804BFF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BFF0
	.thumb_func
sub_804BFF0:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	bl sub_804BC1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804C012
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804C012
	adds r0, r4, #0
	bl sub_8002DE4
_0804C012:
	pop {r4}
	pop {r0}
	bx r0

