	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_807AC60, 0x0807AC60 + 1
	.section .text.sub_804CDCC, "ax", %progbits
@ sub_804CDCC @ JP 0x0804CDCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CDCC
	.thumb_func
sub_804CDCC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804CE0C @ =0x08A1E8AC
	ldr r1, _0804CE10 @ =0x06004400
	bl sub_8013008
	ldr r0, _0804CE14 @ =0x08A1EB0C
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8000D68
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804CE04
	ldr r2, [r4, #0x34]
	lsls r2, r2, #3
	movs r0, #0x7f
	movs r1, #2
	bl sub_807AC60
_0804CE04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CE0C: .4byte 0x08A1E8AC
_0804CE10: .4byte 0x06004400
_0804CE14: .4byte 0x08A1EB0C

