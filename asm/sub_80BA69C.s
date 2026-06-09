	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.set StartArenaDialogue, 0x080BA788 + 1
	.set sub_8008914, 0x08008914 + 1
	.set sub_8031E18, 0x08031E18 + 1
	.set sub_8031E24, 0x08031E24 + 1
	.section .text.sub_80BA69C, "ax", %progbits
@ sub_80BA69C @ JP 0x080BA69C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA69C
	.thumb_func
sub_80BA69C:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetPartyGoldAmount
	adds r4, r0, #0
	bl sub_8031E24
	cmp r0, #2
	beq _080BA6E0
	cmp r0, #2
	bgt _080BA6B8
	cmp r0, #1
	beq _080BA6C2
	b _080BA714
_080BA6B8:
	cmp r0, #3
	beq _080BA6F0
	cmp r0, #4
	beq _080BA70C
	b _080BA714
_080BA6C2:
	bl sub_8031E18
	lsls r0, r0, #1
	bl sub_8008914
	ldr r0, _080BA6DC @ =0x00000876
	adds r1, r5, #0
	bl StartArenaDialogue
	bl sub_8031E18
	lsls r0, r0, #1
	b _080BA6FC
	.align 2, 0
_080BA6DC: .4byte 0x00000876
_080BA6E0:
	ldr r0, _080BA6EC @ =0x00000877
	adds r1, r5, #0
	bl StartArenaDialogue
	b _080BA714
	.align 2, 0
_080BA6EC: .4byte 0x00000877
_080BA6F0:
	ldr r0, _080BA708 @ =0x00000879
	adds r1, r5, #0
	bl StartArenaDialogue
	bl sub_8031E18
_080BA6FC:
	adds r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	b _080BA714
	.align 2, 0
_080BA708: .4byte 0x00000879
_080BA70C:
	ldr r0, _080BA71C @ =0x00000878
	adds r1, r5, #0
	bl StartArenaDialogue
_080BA714:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA71C: .4byte 0x00000878

