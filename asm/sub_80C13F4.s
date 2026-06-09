	.syntax unified
	.set StartMenuAt, 0x0804FA24 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.section .text.sub_80C13F4, "ax", %progbits
@ sub_80C13F4 @ JP 0x080C13F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C13F4
	.thumb_func
sub_80C13F4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080C1420 @ =0x03005270
	movs r0, #0
	strb r0, [r4, #1]
	ldr r0, _080C1424 @ =0x0201AFC0
	ldr r1, _080C1428 @ =0x06001000
	movs r2, #0x80
	movs r3, #0
	bl sub_8003BE8
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r2, #2
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	cmp r0, #0x97
	bgt _080C1434
	ldr r0, _080C142C @ =0x08AC1BC0
	ldr r1, _080C1430 @ =0x08AC1BE4
	b _080C1438
	.align 2, 0
_080C1420: .4byte 0x03005270
_080C1424: .4byte 0x0201AFC0
_080C1428: .4byte 0x06001000
_080C142C: .4byte 0x08AC1BC0
_080C1430: .4byte 0x08AC1BE4
_080C1434:
	ldr r0, _080C1458 @ =0x08AC1BC0
	ldr r1, _080C145C @ =0x08AC1BE8
_080C1438:
	ldr r1, [r1]
	adds r2, r5, #0
	bl StartMenuAt
	adds r3, r0, #0
	ldr r0, _080C1460 @ =0x03005270
	adds r0, #0xcd
	adds r1, r3, #0
	adds r1, #0x60
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	bhs _080C1464
	adds r1, #1
	strb r2, [r1]
	b _080C146C
	.align 2, 0
_080C1458: .4byte 0x08AC1BC0
_080C145C: .4byte 0x08AC1BE8
_080C1460: .4byte 0x03005270
_080C1464:
	subs r0, #1
	adds r2, r3, #0
	adds r2, #0x61
	strb r0, [r2]
_080C146C:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1

