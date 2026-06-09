	.syntax unified
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.set WmRemoveRandomMonsters, 0x080C686C + 1
	.set sub_80BF268, 0x080BF268 + 1
	.set sub_80C2EF0, 0x080C2EF0 + 1
	.section .text.sub_80BE9D4, "ax", %progbits
@ sub_80BE9D4 @ JP 0x080BE9D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE9D4
	.thumb_func
sub_80BE9D4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	movs r2, #0
	bl sub_80C2EF0
	ldr r5, _080BEA0C @ =0x03005270
	ldrb r2, [r5, #0x11]
	lsls r0, r2, #5
	ldr r1, _080BEA10 @ =0x081F5D7C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080BEA18
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	bl WMLoc_GetChapterId
	ldr r1, _080BEA14 @ =0x0202BCEC
	strb r0, [r1, #0xe]
	ldrb r1, [r5]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5]
	b _080BEA22
	.align 2, 0
_080BEA0C: .4byte 0x03005270
_080BEA10: .4byte 0x081F5D7C
_080BEA14: .4byte 0x0202BCEC
_080BEA18:
	adds r0, r2, #0
	bl WMLoc_GetChapterId
	ldr r1, _080BEA38 @ =0x0202BCEC
	strb r0, [r1, #0xe]
_080BEA22:
	adds r0, r4, #0
	bl sub_80BF268
	ldr r1, _080BEA3C @ =0x03005270
	movs r0, #0
	strb r0, [r1, #1]
	bl WmRemoveRandomMonsters
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BEA38: .4byte 0x0202BCEC
_080BEA3C: .4byte 0x03005270

