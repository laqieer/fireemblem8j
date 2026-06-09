	.syntax unified
	.set MapRoute_RenderPathGfx, 0x080C0A38 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C0A98, "ax", %progbits
@ sub_80C0A98 @ JP 0x080C0A98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0A98
	.thumb_func
sub_80C0A98:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x2c]
	lsrs r1, r1, #5
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080C0AC4 @ =0x02019D00
	ldr r2, _080C0AC8 @ =0x01000960
	mov r0, sp
	bl sub_80D6370
	movs r4, #0
	b _080C0AEA
	.align 2, 0
_080C0AC4: .4byte 0x02019D00
_080C0AC8: .4byte 0x01000960
_080C0ACC:
	adds r0, r1, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080C0B04 @ =0x081F6340
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080C0B08 @ =0x02019D00
	movs r2, #0x3c
	adds r3, r6, #0
	bl MapRoute_RenderPathGfx
	adds r4, #1
_080C0AEA:
	ldr r1, [r5, #0x40]
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	blt _080C0ACC
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C0B04: .4byte 0x081F6340
_080C0B08: .4byte 0x02019D00

