	.syntax unified
	.section .text.sub_80C5628, "ax", %progbits
@ GetWMCenteredCameraPosition @ JP 0x080C5628 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetWMCenteredCameraPosition
	.thumb_func
GetWMCenteredCameraPosition:
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, #0x78
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080C5642
	movs r0, #0
	b _080C5648
_080C5642:
	cmp r0, #0xf0
	ble _080C564A
	movs r0, #0xf0
_080C5648:
	strh r0, [r2]
_080C564A:
	adds r0, r1, #0
	subs r0, #0x50
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080C565C
	movs r0, #0
	b _080C5662
_080C565C:
	cmp r0, #0xa0
	ble _080C5664
	movs r0, #0xa0
_080C5662:
	strh r0, [r3]
_080C5664:
	pop {r0}
	bx r0

