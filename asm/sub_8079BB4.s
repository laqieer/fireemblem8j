	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8079BB4, "ax", %progbits
@ sub_8079BB4 @ JP 0x08079BB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079BB4
	.thumb_func
sub_8079BB4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08079BE0 @ =0x08848AD0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r5, #0x2c]
	ldr r0, _08079BE4 @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08079BEC
	ldr r0, _08079BE8 @ =0x0000FFF8
	b _08079BEE
	.align 2, 0
_08079BE0: .4byte 0x08848AD0
_08079BE4: .4byte 0x0203E11C
_08079BE8: .4byte 0x0000FFF8
_08079BEC:
	ldr r0, _08079C00 @ =0x0000FFE0
_08079BEE:
	strh r0, [r5, #0x32]
	movs r0, #1
	bl sub_800226C
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08079C00: .4byte 0x0000FFE0

