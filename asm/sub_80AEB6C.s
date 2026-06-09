	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set ReadExtraMapInfo, 0x080AB6A4 + 1
	.set SetNextGameActionId, 0x08009EB0 + 1
	.section .text.sub_80AEB6C, "ax", %progbits
@ sub_80AEB6C @ JP 0x080AEB6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEB6C
	.thumb_func
sub_80AEB6C:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #8
	bl SetNextGameActionId
	ldr r4, _080AEB94 @ =0x0202BCEC
	ldrb r1, [r4, #0x14]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r4, #0x14]
	bl ReadExtraMapInfo
	movs r0, #0x7f
	strb r0, [r4, #0xe]
	ldr r0, [r5, #0x14]
	bl Proc_End
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AEB94: .4byte 0x0202BCEC

