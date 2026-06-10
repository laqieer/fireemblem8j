	.syntax unified
	.set sub_804F5D4, 0x0804F5D4 + 1
	.section .text.sub_802DD40, "ax", %progbits
@ sub_802DD40 @ JP 0x0802DD40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DD40
	.thumb_func
sub_802DD40:
	push {r4, r5, lr}
	ldr r0, _0802DD9C @ =0x0203A60C
	ldr r5, [r0]
	ldr r4, _0802DDA0 @ =0x085C3FBC
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F5D4
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F5D4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DD9C: .4byte 0x0203A60C
_0802DDA0: .4byte 0x085C3FBC

