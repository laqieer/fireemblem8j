	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8013CD0, "ax", %progbits
@ sub_8013CD0 @ JP 0x08013CD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013CD0
	.thumb_func
sub_8013CD0:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08013CE8 @ =0x03003020
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0
	bne _08013CEC
	adds r0, r1, #0
	bl Proc_End
	b _08013D0C
	.align 2, 0
_08013CE8: .4byte 0x03003020
_08013CEC:
	adds r2, r1, #0
	adds r2, #0x66
	adds r0, r1, #0
	adds r0, #0x64
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r2]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _08013D06
	movs r0, #0
	strh r0, [r2]
_08013D06:
	ldrh r0, [r2]
	lsrs r0, r0, #4
	strb r0, [r3]
_08013D0C:
	pop {r0}
	bx r0

