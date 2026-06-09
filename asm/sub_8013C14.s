	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8013C14, "ax", %progbits
@ sub_8013C14 @ JP 0x08013C14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013C14
	.thumb_func
sub_8013C14:
	push {lr}
	adds r2, r0, #0
	ldr r0, _08013C2C @ =0x03003020
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne _08013C30
	adds r0, r2, #0
	bl Proc_End
	b _08013C54
	.align 2, 0
_08013C2C: .4byte 0x03003020
_08013C30:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _08013C4E
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_08013C4E:
	ldrh r0, [r1]
	lsrs r0, r0, #4
	strb r0, [r3]
_08013C54:
	pop {r0}
	bx r0

