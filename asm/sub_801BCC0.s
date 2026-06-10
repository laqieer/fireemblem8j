	.syntax unified
	.set ReadLastGameSaveId, 0x080A97E4 + 1
	.set SavePlayThroughData, 0x080A9658 + 1
	.set sub_080D63AC, 0x080D63AC + 1
	.set sub_8031160, 0x08031160 + 1
	.set sub_80A9A28, 0x080A9A28 + 1
	.section .text.sub_801BCC0, "ax", %progbits
@ sub_801BCC0 @ JP 0x0801BCC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BCC0
	.thumb_func
sub_801BCC0:
	push {lr}
	bl SavePlayThroughData
	ldr r2, _0801BCE8 @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2, #0x14]
	bl sub_8031160
	bl ReadLastGameSaveId
	bl sub_80A9A28
	movs r0, #0xff
	bl sub_080D63AC
	pop {r1}
	bx r1
	.align 2, 0
_0801BCE8: .4byte 0x0202BCEC

