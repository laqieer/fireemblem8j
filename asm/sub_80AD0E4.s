	.syntax unified
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_80AD0E4, "ax", %progbits
@ sub_80AD0E4 @ JP 0x080AD0E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD0E4
	.thumb_func
sub_80AD0E4:
	push {lr}
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080AD112
	ldr r1, _080AD11C @ =0x0202BCAC
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _080AD0FC
	adds r0, #0xf
_080AD0FC:
	asrs r0, r0, #4
	adds r0, #7
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bge _080AD10A
	adds r1, #0xf
_080AD10A:
	asrs r1, r1, #4
	adds r1, #5
	bl SetCursorMapPosition
_080AD112:
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_080AD11C: .4byte 0x0202BCAC

