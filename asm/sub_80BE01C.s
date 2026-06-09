	.syntax unified
	.set RefreshGmNodeLinks, 0x080C184C + 1
	.set ResetGmStoryNode, 0x080C1DC0 + 1
	.set WorldMap_SetMergedNodeIcon, 0x080BDFDC + 1
	.set sub_80BDC24, 0x080BDC24 + 1
	.set sub_80BDD28, 0x080BDD28 + 1
	.set sub_80BDE6C, 0x080BDE6C + 1
	.set sub_80BDEB4, 0x080BDEB4 + 1
	.set sub_80BDF94, 0x080BDF94 + 1
	.set sub_80BFA40, 0x080BFA40 + 1
	.set sub_80C0018, 0x080C0018 + 1
	.set sub_80C07E8, 0x080C07E8 + 1
	.set sub_80C0A08, 0x080C0A08 + 1
	.set sub_80C2A10, 0x080C2A10 + 1
	.set sub_80C8444, 0x080C8444 + 1
	.section .text.sub_80BE01C, "ax", %progbits
@ sub_80BE01C @ JP 0x080BE01C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE01C
	.thumb_func
sub_80BE01C:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_80BDC24
	adds r0, r5, #0
	bl sub_80BDD28
	adds r0, r5, #0
	bl sub_80BDE6C
	movs r0, #5
	bl sub_80BFA40
	str r0, [r5, #0x44]
	str r0, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #3
	movs r3, #0xa
	bl sub_80C07E8
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x44]
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0xc
	bl sub_80C0018
	str r0, [r5, #0x4c]
	movs r1, #0x96
	lsls r1, r1, #5
	ldr r3, [r5, #0x44]
	movs r0, #5
	movs r2, #4
	bl sub_80C0A08
	str r0, [r5, #0x50]
	adds r0, r5, #0
	bl sub_80C2A10
	str r0, [r5, #0x54]
	ldr r4, _080BE0D8 @ =0x03005270
	adds r0, r4, #0
	bl RefreshGmNodeLinks
	adds r0, r5, #0
	bl sub_80C8444
	adds r0, r5, #0
	bl sub_80BDEB4
	adds r0, r5, #0
	bl sub_80BDF94
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BE09A
	adds r0, r5, #0
	bl WorldMap_SetMergedNodeIcon
_080BE09A:
	ldr r0, [r5, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080BE0DC @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BE0C6
	bl ResetGmStoryNode
	ldr r0, [r5, #0x48]
	adds r0, #0x32
	ldrb r2, [r0]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
_080BE0C6:
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BE0D8: .4byte 0x03005270
_080BE0DC: .4byte 0x0202BCEC

