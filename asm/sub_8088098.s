	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8088098, "ax", %progbits
@ sub_8088098 @ JP 0x08088098 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088098
	.thumb_func
sub_8088098:
	push {lr}
	cmp r1, #0
	bne _080880B8
	ldr r1, _080880B0 @ =0x08A60AE8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080880B4 @ =0x06002800
	bl sub_8013008
	b _080880C6
	.align 2, 0
_080880B0: .4byte 0x08A60AE8
_080880B4: .4byte 0x06002800
_080880B8:
	ldr r1, _080880CC @ =0x08A60AE8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080880D0 @ =0x06004000
	bl sub_8013008
_080880C6:
	pop {r0}
	bx r0
	.align 2, 0
_080880CC: .4byte 0x08A60AE8
_080880D0: .4byte 0x06004000

