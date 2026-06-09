	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.section .text.sub_8006374, "ax", %progbits
@ sub_8006374 @ JP 0x08006374 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006374
	.thumb_func
sub_8006374:
	push {r4, lr}
	adds r4, r0, #0
	bl AdvanceGetLCGRNValue
	adds r1, r0, #0
	lsrs r2, r1, #0x10
	ldrh r1, [r4, #0x30]
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	bhi _080063CC
	lsls r0, r1, #2
	ldr r1, _08006398 @ =_0800639C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006398: .4byte _0800639C
_0800639C: @ jump table
	.4byte _080063BA @ case 0
	.4byte _080063C0 @ case 1
	.4byte _080063B0 @ case 2
	.4byte _080063C6 @ case 3
	.4byte _080063CA @ case 4
_080063B0:
	asrs r0, r2, #7
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	b _080063CC
_080063BA:
	asrs r0, r2, #7
	adds r0, #0x1e
	b _080063CC
_080063C0:
	asrs r0, r2, #9
	adds r0, #0x1e
	b _080063CC
_080063C6:
	movs r0, #1
	b _080063CC
_080063CA:
	ldr r0, _080063D4 @ =0x7FFFFFFF
_080063CC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080063D4: .4byte 0x7FFFFFFF

