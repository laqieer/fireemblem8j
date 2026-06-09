	.syntax unified
	.set GetPaletteIdForAllegience, 0x080BFC04 + 1
	.set GmapUnitFade_AddUnit, 0x080C02CC + 1
	.set MapUnitC_SetPalette, 0x080BFEA8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80BFDD4, 0x080BFDD4 + 1
	.set sub_80C0218, 0x080C0218 + 1
	.set sub_80C02BC, 0x080C02BC + 1
	.section .text.sub_80C02F0, "ax", %progbits
@ sub_80C02F0 @ JP 0x080C02F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C02F0
	.thumb_func
sub_80C02F0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r0, _080C0334 @ =0x08AC1108
	bl Proc_Find
	ldr r6, [r0, #0x4c]
	lsls r1, r5, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r4, [r0]
	bl sub_80C02BC
	cmp r0, #0
	bne _080C0338
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl GetPaletteIdForAllegience
	adds r2, r0, #0
	movs r1, #1
	rsbs r1, r1, #0
	str r7, [sp]
	adds r0, r5, #0
	mov r3, r8
	bl sub_80C0218
	b _080C033E
	.align 2, 0
_080C0334: .4byte 0x08AC1108
_080C0338:
	adds r0, r5, #0
	bl GmapUnitFade_AddUnit
_080C033E:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl MapUnitC_SetPalette
	ldr r0, _080C0364 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x4c]
	adds r1, r5, #0
	movs r2, #1
	bl sub_80BFDD4
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0364: .4byte 0x08AC1108

