	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.section .text.sub_80789BC, "ax", %progbits
@ sub_80789BC @ JP 0x080789BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80789BC
	.thumb_func
sub_80789BC:
	push {lr}
	bl GetAnimPosition
	cmp r0, #0
	bne _080789D0
	ldr r0, _080789CC @ =0x0203E184
	b _080789D2
	.align 2, 0
_080789CC: .4byte 0x0203E184
_080789D0:
	ldr r0, _080789E0 @ =0x0203E188
_080789D2:
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	cmp r0, #0xa8
	beq _080789E4
	movs r0, #0
	b _080789E6
	.align 2, 0
_080789E0: .4byte 0x0203E188
_080789E4:
	movs r0, #1
_080789E6:
	pop {r1}
	bx r1
	.align 2, 0

