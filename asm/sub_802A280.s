	.syntax unified
	.set BattlePrintDebugHitInfo, 0x0802CA34 + 1
	.set nullsub_42, 0x0802CA30 + 1
	.set sub_802BF70, 0x0802BF70 + 1
	.set sub_802C248, 0x0802C248 + 1
	.section .text.sub_802A280, "ax", %progbits
@ sub_802A280 @ JP 0x0802A280 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A280
	.thumb_func
sub_802A280:
	push {lr}
	bl sub_802BF70
	bl sub_802C248
	ldr r0, _0802A29C @ =0x0203A4E8
	ldr r1, _0802A2A0 @ =0x0203A568
	bl nullsub_42
	bl BattlePrintDebugHitInfo
	pop {r0}
	bx r0
	.align 2, 0
_0802A29C: .4byte 0x0203A4E8
_0802A2A0: .4byte 0x0203A568

