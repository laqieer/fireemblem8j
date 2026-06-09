	.syntax unified
	.set EkrDispUP_SetPositionUnsync, 0x08052840 + 1
	.set EkrDispUpClear4C50, 0x08052800 + 1
	.set UnAsyncEkrDispUP, 0x08052898 + 1
	.set UnsyncEkrDispUP, 0x08052878 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80527BC, "ax", %progbits
@ sub_80527BC @ JP 0x080527BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80527BC
	.thumb_func
sub_80527BC:
	push {r4, lr}
	ldr r4, _080527E4 @ =0x0200006C
	ldr r0, _080527E8 @ =0x085E37CC
	movs r1, #5
	bl sub_8002BCC
	str r0, [r4]
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_SetPositionUnsync
	bl EkrDispUpClear4C50
	bl UnAsyncEkrDispUP
	bl UnsyncEkrDispUP
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080527E4: .4byte 0x0200006C
_080527E8: .4byte 0x085E37CC

