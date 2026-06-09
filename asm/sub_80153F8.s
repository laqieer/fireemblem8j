	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set sub_800D340, 0x0800D340 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_80153F8, "ax", %progbits
@ sub_80153F8 @ JP 0x080153F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80153F8
	.thumb_func
sub_80153F8:
	push {r4, lr}
	ldr r0, _0801541C @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	adds r4, r0, #0
	bl sub_80C1E74
	cmp r0, #2
	beq _08015420
	ldr r0, [r4, #0x48]
	movs r1, #1
	bl sub_800D340
	b _08015428
	.align 2, 0
_0801541C: .4byte 0x0202BCEC
_08015420:
	ldr r0, _08015430 @ =0x08A71CE8
	movs r1, #1
	bl sub_800D340
_08015428:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08015430: .4byte 0x08A71CE8

