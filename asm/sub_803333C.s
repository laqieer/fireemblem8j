	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80315D4, 0x080315D4 + 1
	.section .text.sub_803333C, "ax", %progbits
@ sub_803333C @ JP 0x0803333C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803333C
	.thumb_func
sub_803333C:
	push {lr}
	bl sub_80315D4
	adds r2, r0, #0
	cmp r2, #0
	beq _08033362
	ldr r0, [r2, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xff
	strb r0, [r2, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r2, #0x11]
	bl RefreshEntityBmMaps
	bl sub_8027144
_08033362:
	pop {r0}
	bx r0
	.align 2, 0

