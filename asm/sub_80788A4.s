	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80788A4, "ax", %progbits
@ sub_80788A4 @ JP 0x080788A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80788A4
	.thumb_func
sub_80788A4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080788C8 @ =0x020228A8
	ldr r1, _080788CC @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080788C8: .4byte 0x020228A8
_080788CC: .4byte 0x020165C8

