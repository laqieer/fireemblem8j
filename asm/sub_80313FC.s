	.syntax unified
	.set ComputeChapterRankings, 0x080BB088 + 1
	.set SaveEndgameRankings, 0x080A881C + 1
	.set sub_80A8D94, 0x080A8D94 + 1
	.section .text.sub_80313FC, "ax", %progbits
@ sub_80313FC @ JP 0x080313FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80313FC
	.thumb_func
sub_80313FC:
	push {r4, lr}
	ldr r4, _0803141C @ =0x0202BCEC
	adds r0, r4, #0
	bl sub_80A8D94
	bl ComputeChapterRankings
	bl SaveEndgameRankings
	ldrb r1, [r4, #0x14]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803141C: .4byte 0x0202BCEC

