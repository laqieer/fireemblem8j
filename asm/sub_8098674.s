	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set StartBgmVolumeChange, 0x08002680 + 1
	.section .text.sub_8098674, "ax", %progbits
@ sub_8098674 @ JP 0x08098674 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098674
	.thumb_func
sub_8098674:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r0, [r5]
	cmp r0, #3
	bne _08098690
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
_08098690:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #4
	bhi _080986D8
	lsls r0, r0, #2
	ldr r1, _080986A4 @ =_080986A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080986A4: .4byte _080986A8
_080986A8: @ jump table
	.4byte _080986D0 @ case 0
	.4byte _080986D0 @ case 1
	.4byte _080986C6 @ case 2
	.4byte _080986BC @ case 3
	.4byte _080986D0 @ case 4
_080986BC:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	b _080986D8
_080986C6:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080986D8
_080986D0:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_080986D8:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

