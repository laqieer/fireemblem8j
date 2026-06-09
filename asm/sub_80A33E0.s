	.syntax unified
	.set ArchivePalette, 0x080135D8 + 1
	.set SetPalFadeStClkEnd, 0x0801350C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_80A33E0, "ax", %progbits
@ sub_80A33E0 @ JP 0x080A33E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A33E0
	.thumb_func
sub_80A33E0:
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r2, #0
	mov r1, sp
	ldr r0, _080A3404 @ =0x081F5664
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A3408
	movs r2, #1
	b _080A3428
	.align 2, 0
_080A3404: .4byte 0x081F5664
_080A3408:
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A3428
	cmp r0, #1
	bgt _080A341C
	cmp r0, #0
	beq _080A3422
	b _080A3428
_080A341C:
	cmp r0, #2
	beq _080A3426
	b _080A3428
_080A3422:
	movs r2, #3
	b _080A3428
_080A3426:
	movs r2, #2
_080A3428:
	lsls r0, r2, #2
	add r0, sp
	ldr r0, [r0]
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A3450
	movs r0, #0x20
	bl ArchivePalette
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl SetPalFadeStClkEnd
_080A3450:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

