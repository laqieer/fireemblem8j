	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.section .text.sub_801D500, "ax", %progbits
@ sub_801D500 @ JP 0x0801D500 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D500
	.thumb_func
sub_801D500:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801D528 @ =0x08A74F6C
	ldr r1, _0801D52C @ =0x06005080
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterDataMove
	ldr r0, _0801D530 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801D534
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #2
	strh r0, [r1]
	b _0801D544
	.align 2, 0
_0801D528: .4byte 0x08A74F6C
_0801D52C: .4byte 0x06005080
_0801D530: .4byte 0x0202BCAC
_0801D534:
	ldr r1, _0801D54C @ =0x06005000
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r4, #0
	bl Proc_End
_0801D544:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D54C: .4byte 0x06005000

