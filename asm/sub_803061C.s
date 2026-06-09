	.syntax unified
	.set SetSecondaryHBlankHandler, 0x08001D3C + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_803061C, "ax", %progbits
@ sub_803061C @ JP 0x0803061C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803061C
	.thumb_func
sub_803061C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _08030654 @ =0x02002ADC
	movs r4, #0
	ldr r0, _08030658 @ =WfxBlueHSync
	mov r8, r0
	movs r7, #0x1f
	ldr r6, _0803065C @ =0x0000013F
_0803062E:
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	subs r0, r7, r0
	lsls r0, r0, #0xa
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r6
	ble _0803062E
	mov r0, r8
	bl SetSecondaryHBlankHandler
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030654: .4byte 0x02002ADC
_08030658: .4byte 0x080305C5  @ WfxBlueHSync
_0803065C: .4byte 0x0000013F

