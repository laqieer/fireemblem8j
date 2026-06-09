	.syntax unified
	.set sub_8013048, 0x08013048 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8012F94, "ax", %progbits
@ sub_8012F94 @ JP 0x08012F94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012F94
	.thumb_func
sub_8012F94:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8013048
	adds r2, r0, #0
	subs r1, r2, #4
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	beq _08012FBC
	adds r0, r4, #4
	lsrs r2, r1, #0x1f
	adds r2, r1, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r1, r5, #0
	bl sub_80D6370
	b _08012FD2
_08012FBC:
	adds r3, r4, #4
	adds r0, r1, #0
	cmp r0, #0
	bge _08012FC6
	subs r0, r2, #1
_08012FC6:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_80D636C
_08012FD2:
	pop {r4, r5}
	pop {r0}
	bx r0

