	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set GetItemIndex, 0x08017294 + 1
	.set NewMapLatonaShiningfx, 0x0807F6A4 + 1
	.set StartPaletteAnimatorNormal, 0x080144F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014494, 0x08014494 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_807F4F8, "ax", %progbits
@ sub_807F4F8 @ JP 0x0807F4F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F4F8
	.thumb_func
sub_807F4F8:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x42
	ldrh r0, [r4]
	cmp r0, #2
	bls _0807F5AC
	bl sub_8014494
	ldr r4, _0807F53C @ =0x08A20600
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorNormal
	ldr r0, _0807F540 @ =0x0203E1EC
	ldr r0, [r0, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8c
	bne _0807F548
	ldr r0, _0807F544 @ =0x08A20640
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorNormal
	b _0807F556
	.align 2, 0
_0807F53C: .4byte 0x08A20600
_0807F540: .4byte 0x0203E1EC
_0807F544: .4byte 0x08A20640
_0807F548:
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorNormal
_0807F556:
	ldr r4, _0807F5A4 @ =0x08A20680
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807F5A8 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807F572
	adds r0, #7
_0807F572:
	asrs r0, r0, #3
	subs r2, r0, #4
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bge _0807F57E
	adds r1, #7
_0807F57E:
	asrs r1, r1, #3
	subs r1, #4
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r2, #0
	movs r2, #8
	movs r3, #0x3c
	bl NewMapLatonaShiningfx
	adds r0, r5, #0
	bl sub_8002DE4
	ldr r1, [r5, #0x30]
	movs r0, #0x8c
	bl sub_8014B50
	b _0807F5FE
	.align 2, 0
_0807F5A4: .4byte 0x08A20680
_0807F5A8: .4byte 0x06002800
_0807F5AC:
	ldr r0, _0807F608 @ =0x08A140A0
	ldrh r1, [r4]
	lsls r2, r1, #2
	adds r2, r2, r0
	movs r3, #0
	ldrsh r2, [r2, r3]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807F5CC
	adds r0, #7
_0807F5CC:
	asrs r0, r0, #3
	adds r0, r0, r2
	subs r2, r0, #3
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bge _0807F5DA
	adds r1, #7
_0807F5DA:
	asrs r1, r1, #3
	adds r1, r1, r3
	subs r1, #3
	movs r0, #8
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r2, #0
	movs r2, #6
	movs r3, #0xa
	bl NewMapLatonaShiningfx
	ldr r1, [r5, #0x30]
	movs r0, #0x89
	bl sub_8014B50
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_0807F5FE:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F608: .4byte 0x08A140A0

