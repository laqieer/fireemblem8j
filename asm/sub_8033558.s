	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CanPrepScreenSave, 0x080972D4 + 1
	.set ResetText, 0x08003BC4 + 1
	.set sub_801D730, 0x0801D730 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_808F44C, 0x0808F44C + 1
	.set sub_8097C50, 0x08097C50 + 1
	.set sub_8099290, 0x08099290 + 1
	.set sub_80992B4, 0x080992B4 + 1
	.set sub_80992D0, 0x080992D0 + 1
	.set sub_80992EC, 0x080992EC + 1
	.set sub_8099308, 0x08099308 + 1
	.set sub_80993B0, 0x080993B0 + 1
	.set sub_8099438, 0x08099438 + 1
	.section .text.sub_8033558, "ax", %progbits
@ sub_8033558 @ JP 0x08033558 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033558
	.thumb_func
sub_8033558:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_808BB14
	bl ResetText
	bl sub_808F44C
	bl sub_801D730
	adds r0, r4, #0
	bl sub_8099290
	ldr r1, _080335D4 @ =sub_8033268
	ldr r3, _080335D8 @ =0x0000051B
	ldr r0, _080335DC @ =0x0000054D
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8099308
	bl sub_8097C50
	movs r2, #0
	cmp r0, #0
	bne _08033596
	movs r2, #1
_08033596:
	ldr r1, _080335E0 @ =sub_803327C
	ldr r3, _080335E4 @ =0x0000051C
	ldr r0, _080335E8 @ =0x0000054E
	str r0, [sp]
	movs r0, #2
	bl sub_8099308
	ldr r1, _080335EC @ =sub_803332C
	ldr r3, _080335F0 @ =0x0000051D
	ldr r0, _080335F4 @ =0x0000054F
	str r0, [sp]
	movs r0, #8
	movs r2, #0
	bl sub_8099308
	bl CanPrepScreenSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033600
	ldr r1, _080335F8 @ =sub_8033368
	ldr r3, _080335FC @ =0x0000050D
	movs r0, #0xaa
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #9
	movs r2, #0
	bl sub_8099308
	b _08033612
	.align 2, 0
_080335D4: .4byte 0x08033269  @ sub_8033268
_080335D8: .4byte 0x0000051B
_080335DC: .4byte 0x0000054D
_080335E0: .4byte 0x0803327D  @ sub_803327C
_080335E4: .4byte 0x0000051C
_080335E8: .4byte 0x0000054E
_080335EC: .4byte 0x0803332D  @ sub_803332C
_080335F0: .4byte 0x0000051D
_080335F4: .4byte 0x0000054F
_080335F8: .4byte 0x08033369  @ sub_8033368
_080335FC: .4byte 0x0000050D
_08033600:
	ldr r1, _08033648 @ =sub_8033368
	ldr r3, _0803364C @ =0x0000050D
	movs r0, #0xaa
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #9
	movs r2, #1
	bl sub_8099308
_08033612:
	adds r0, r4, #0
	bl StartPrepHelpPrompt
	ldr r0, _08033650 @ =sub_80332D4
	bl sub_80992B4
	ldr r0, _08033654 @ =sub_80332B4
	bl sub_80992D0
	ldr r0, _08033658 @ =sub_8033544
	bl sub_80992EC
	movs r0, #0xa
	movs r1, #2
	bl sub_8099438
	ldr r0, [r4, #0x58]
	bl sub_80993B0
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033648: .4byte 0x08033369  @ sub_8033368
_0803364C: .4byte 0x0000050D
_08033650: .4byte 0x080332D5  @ sub_80332D4
_08033654: .4byte 0x080332B5  @ sub_80332B4
_08033658: .4byte 0x08033545  @ sub_8033544

