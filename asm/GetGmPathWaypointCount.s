	.syntax unified
	.section .text.GetGmPathWaypointCount, "ax", %progbits
@ GetGmPathWaypointCount @ JP 0x080C1218 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetGmPathWaypointCount
	.thumb_func
GetGmPathWaypointCount:
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080C1230 @ =0x081F6340
	adds r1, r1, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	bne _080C1234
	movs r0, #0
	b _080C1244
	.align 2, 0
_080C1230: .4byte 0x081F6340
_080C1234:
	movs r2, #0
	b _080C123C
_080C1238:
	adds r1, #8
	adds r2, #1
_080C123C:
	ldr r0, [r1]
	cmp r0, #0
	bge _080C1238
	adds r0, r2, #0
_080C1244:
	pop {r1}
	bx r1

