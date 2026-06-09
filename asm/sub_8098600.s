	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8034014, 0x08034014 + 1
	.set sub_8090A70, 0x08090A70 + 1
	.set sub_8097F0C, 0x08097F0C + 1
	.set sub_809C23C, 0x0809C23C + 1
	.set sub_80A2BF8, 0x080A2BF8 + 1
	.section .text.sub_8098600, "ax", %progbits
@ sub_8098600 @ JP 0x08098600 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098600
	.thumb_func
sub_8098600:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8097F0C
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _08098668
	lsls r0, r0, #2
	ldr r1, _08098620 @ =_08098624
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08098620: .4byte _08098624
_08098624: @ jump table
	.4byte _08098648 @ case 0
	.4byte _08098640 @ case 1
	.4byte _08098662 @ case 2
	.4byte _08098658 @ case 3
	.4byte _08098638 @ case 4
_08098638:
	adds r0, r4, #0
	bl sub_8090A70
	b _08098668
_08098640:
	adds r0, r4, #0
	bl sub_809C23C
	b _08098668
_08098648:
	ldr r0, _08098654 @ =0x08A94BD0
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _08098668
	.align 2, 0
_08098654: .4byte 0x08A94BD0
_08098658:
	movs r0, #2
	adds r1, r4, #0
	bl sub_80A2BF8
	b _08098668
_08098662:
	adds r0, r4, #0
	bl sub_8034014
_08098668:
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

